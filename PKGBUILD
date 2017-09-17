# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor:

pkgname=rmate-git
pkgver=r69.5ee0456
pkgrel=1
pkgdesc='Edit files from an ssh session in TextMate'
arch=('any')
url='https://blog.macromates.com/2011/mate-and-rmate'
license=('custom:MIT')
depends=('ruby')
provides=('rmate')
conflicts=('rmate')
options=('libtool' 'staticlibs' '!strip')

source=(
    "${pkgname}::git+https://github.com/textmate/rmate.git"
    'LICENSE'
)

sha512sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${pkgname}" rev-list --count HEAD)" \
    "$(git -C "${pkgname}" rev-parse --short HEAD)"
}

package() {
    install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
      "${srcdir}/LICENSE" \
      "${srcdir}/${pkgname}/rmate.gemspec"

    install -D -m 755 -t "${pkgdir}/usr/bin" \
      "${srcdir}/${pkgname}/bin/rmate"
}
