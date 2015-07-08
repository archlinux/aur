pkgname=fortune-mod-chuck
pkgver=1504021525
pkgrel=1
_ver=5
pkgdesc="Fortune quotes from Chuck"
arch=('any')
license=('custom:cc-sa-3.0')
url=("http://en.wikiquote.org/wiki/Chuck")
depends=('fortune-mod')
makedepends=('fortune-mod' 'make' 'coreutils' 'sed' 'grep' 'wikiquote-fortune>=1.4')
source=("https://github.com/maandree/wikiquote-fortune-collection/archive/${_ver}.tar.gz")
sha256sums=(f25b0e335782fc59bf960e5f09c16ebd0bd38cb9cb174f0338c6ba5f8d3013b5)


build()
{
    cd "${srcdir}/wikiquote-fortune-collection-${_ver}"
    make SHOWS=chuck SCRIPTS=
}

package()
{
    cd "${srcdir}/wikiquote-fortune-collection-${_ver}"
    cd quotes/chuck
    install -dm755 -- "${pkgdir}/usr/share/fortune"
    install -m644 -- chuck chuck.dat "${pkgdir}/usr/share/fortune"
}

