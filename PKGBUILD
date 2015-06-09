# Contributor: Balwinder S "bsd" Dheeman (bdheeman AT gmail.com)

pkgname=fbsplash-theme-natural-arch
_thmname=${pkgname#fbsplash\-theme\-}
pkgver=1.0.0
pkgrel=3
pkgdesc="An fbsplash theme with natural-arch logo"
arch=(any)
license=('CCPL:cc-by-nc-sa')
url='http://OpenDesktop.org/content/show.php?content=118457'
depends=('fbsplash')
source=(http://OpenDesktop.org/CONTENT/content-files/118457-natural-arch.tar.gz)
install=fbsplash-theme.install

package() {
    if [ -d /etc/fbsplash ]; then
	_splashdir="fbsplash"
    else
	_splashdir="splash"
    fi

    mkdir -p "${pkgdir}/etc/${_splashdir}"
    cp -a "${srcdir}/${_thmname}" "${pkgdir}/etc/${_splashdir}/${_thmname}"

    # make install script nice...
    sed -i "s/add '.*' to/add '${_thmname}' to/" $startdir/$install
}

# vim:set ts=4 sw=4 et:
md5sums=('f871f019fc90b63f940af4a23b0bf7d4')
