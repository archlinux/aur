pkgname=goenv
pkgver=2.2.22
pkgrel=1
pkgdesc="Like pyenv and rbenv, but for Go."
arch=('i686' 'x86_64')
url="https://github.com/syndbg/goenv"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('30fd9e71748a722ee2850eaef1e92a10')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  for file in $(ls -1 libexec/); do
    install -D -m755 libexec/${file} "${pkgdir}/usr/lib/goenv/libexec/${file}"
  done

  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/goenv/libexec/goenv "${pkgdir}/usr/bin/goenv"
  echo "$pkgver" > "${pkgdir}/usr/lib/goenv/APP_VERSION"

}
