# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: neeshy <neeshy@tfwno.gf>

pkgname=ripme-bin
pkgver=2.1.6
_pkgver=${pkgver}-1-68189f27
pkgrel=1
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/ripmeapp2/ripme"
license=('MIT')
depends=('java-runtime>=20')
provides=('ripme')
conflicts=('ripme')
source=("https://github.com/ripmeapp2/ripme/releases/download/${pkgver}/ripme-${_pkgver}.jar")
sha256sums=('adffec078cc6e1da42699f874176744622a00a1dace000f2ef0c7dad28957faa')

package() {
  cd "${srcdir}"
  install -Dm644 "ripme-${_pkgver}.jar" "${pkgdir}/usr/share/java/ripme.jar"
  cat <<EOF | install -Dm755 /dev/stdin "${pkgdir}/usr/bin/ripme"
#!/bin/sh
exec java -jar /usr/share/java/ripme.jar "\$@"
EOF
}
