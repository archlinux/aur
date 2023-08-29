# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: neeshy <neeshy@tfwno.gf>

pkgname=ripme-bin
pkgver=2.1.5
_pkgver=2.1.4-38-836a7494
pkgrel=1
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/ripmeapp2/ripme"
license=('MIT')
depends=('java-runtime>=20')
provides=('ripme')
conflicts=('ripme')
source=("https://github.com/ripmeapp2/ripme/releases/download/${pkgver}/ripme-${_pkgver}.jar")
sha256sums=('a82ad80fe406a01adf37b3de403245ad78e0669aa96b91d6befe29aaf88200d2')

package() {
  cd "${srcdir}"
  install -Dm644 "ripme-${_pkgver}.jar" "${pkgdir}/usr/share/java/ripme.jar"
  cat <<EOF | install -Dm755 /dev/stdin "${pkgdir}/usr/bin/ripme"
#!/bin/sh
exec java -jar /usr/share/java/ripme.jar "\$@"
EOF
}
