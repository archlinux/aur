# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='opennhrp'
pkgver='0.14.1'
pkgrel='1'
pkgdesc="An opensource NHRP implementation"
arch=('x86_64' 'aarch64')
url="https://sourceforge.net/projects/${pkgname}"
license=('MIT')
depends=('linux>=3.7.4-1' 'bash' 'c-ares')
backup=("etc/${pkgname}/${pkgname}.conf")
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('1517d53d688ffc165a1da20c344d96b4c53e60f34bd73c64e60cb67cfca4e9ab')

build() {
  cd "${pkgname}-${pkgver}"

  make SBINDIR="/usr/bin"
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm0644 "MIT-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
