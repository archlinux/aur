pkgname=goenv
pkgver=2.0.0beta11
pkgrel=1
pkgdesc="Like pyenv and rbenv, but for Go."
arch=('i686' 'x86_64')
url="https://github.com/syndbg/goenv"
license=('MIT')
# https://github.com/syndbg/goenv/archive/2.0.0beta11.tar.gz
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('971e0e2cf572af5dabb6f7c8eb7b1be0')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  for file in $(ls -1 libexec/); do
    install -D -m755 libexec/${file} "${pkgdir}/usr/lib/goenv/libexec/${file}"
  done

}
