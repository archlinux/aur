# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=jetbrains-mps
pkgver=3.2.3
pkgrel=1
pkgdesc="JetBrains Meta Programming System"
arch=('any')
url="http://www.jetbrains.com/mps/index.html"
license=('custom: MPS license agreement')
depends=('jdk')

source=("http://download.jetbrains.com/mps/32/MPS-${pkgver}.tar.gz")
sha256sums=('f0b75eb106a7aa2b3a5ea6cf6cfe98583911f2aa726c59c3cee6ded6b00ab043')

build() {
  cd "${srcdir}"
  echo "#!/bin/sh" > mps
  echo "JDK_HOME=/usr/lib/jvm/java-8-jdk /opt/JetBrains-MPS/mps.sh" >> mps
}

package() {
  install -d "${pkgdir}/opt/"
  mv "${srcdir}/MPS 3.2/" "${pkgdir}/opt/JetBrains-MPS"
  install -Dm 755 "${srcdir}/mps" "${pkgdir}/usr/bin/mps"
}
