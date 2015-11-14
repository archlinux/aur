# Maintainer Holger Obermaier
pkgname="password-gorilla"
realpkgname="gorilla"
pkgver="1.5.3.7"
pkgrel=3
pkgdesc="A cross-platform password manager."
arch=('x86_64')
url="https://github.com/zdia/gorilla/wiki/"
license=('GPL2')
source=( "http://gorilla.dp100.com/downloads/${realpkgname}1537_64.bin"
         "http://gorilla.dp100.com/downloads/${realpkgname}-1.5.3.7.zip" )
md5sums=( 'f41395230978380820b8e2cc9bd5a708'
          'f5ed6b1994401d2204d3fed2e0e5d938' )
options=( '!strip' )

package() {
    # directory structur
    local bin_dir="${pkgdir}/usr/bin"
    local icon_dir="${pkgdir}/usr/share/icons/hicolor"
    local icon48x48_dir="${icon_dir}/48x48/apps"
    local icon32x32_dir="${icon_dir}/32x32/apps"
    local icon16x16_dir="${icon_dir}/16x16/apps"
    local pixmaps_dir="${pkgdir}/usr/share/pixmaps"
    local desktop_dir="${pkgdir}/usr/share/applications"
    local man_dir="${pkgdir}/usr/share/man/man1"

    # binary
    install -D --preserve-timestamps --verbose --mode=u=rwx,go=rx "${srcdir}/gorilla1537_64.bin" "${bin_dir}/gorilla"

    # icons
    install -D --preserve-timestamps --verbose "${srcdir}/${realpkgname}-${pkgver}/utilities/make-deb.data/16x16.password-gorilla.png" "${icon16x16_dir}/password-gorilla.png"
    install -D --preserve-timestamps --verbose "${srcdir}/${realpkgname}-${pkgver}/utilities/make-deb.data/32x32.password-gorilla.png" "${icon32x32_dir}/password-gorilla.png"
    install -D --preserve-timestamps --verbose "${srcdir}/${realpkgname}-${pkgver}/utilities/make-deb.data/48x48.password-gorilla.png" "${icon48x48_dir}/password-gorilla.png"

    # desktop file
    install -D --preserve-timestamps --verbose "${srcdir}/${realpkgname}-${pkgver}/utilities/make-deb.data/password-gorilla.desktop" "${desktop_dir}/password-gorilla.desktop"

    # man file
    install -D --preserve-timestamps --verbose "${srcdir}/${realpkgname}-${pkgver}/utilities/make-deb.data/password-gorilla.1" "${man_dir}/password-gorilla.1"
}
