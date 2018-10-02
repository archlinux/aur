# Maintainer Connor Prussin <connor at prussin dot net>
pkgname=minichrome
pkgver=0.0.1
pkgrel=3
pkgdesc="A minimal web browser"
arch=('i686' 'x86_64')
url="https://github.com/cprussin/minichrome"
license=('MIT')
depends=()
source=('https://github.com/cprussin/minichrome/releases/download/v0.0.1/minichrome-0.0.1.tar.gz')
md5sums=('e5970dc887d7dedda5e530f0317f6140')

package() {
  mkdir -p "${pkgdir}/usr/lib"
  cp -R "${srcdir}/minichrome-linux-x64" "${pkgdir}/usr/lib"
  mv "${pkgdir}/usr/lib/minichrome-linux-x64" "${pkgdir}/usr/lib/minichrome"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/minichrome/minichrome" "${pkgdir}/usr/bin/minichrome"
  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/usr/lib/minichrome/minichrome"
}
