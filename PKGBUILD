# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>

pkgname=retroshare-bin
_pkgname=retroshare
pkgver='0.6.7'
_subver='20231128'
pkgrel=1
pkgdesc='Serverless encrypted instant messenger with filesharing, chatgroups, e-mail.'
arch=('x86_64')
url='https://retroshare.cc/'
license=('AGPL' 'GPL' 'LGPL')
depends=('bzip2'
         'gcc-libs'
         'glibc'
         'hicolor-icon-theme'
         'libupnp'
         'libx11'
         'libxss'
         'openssl'
         'qt5-base'
         'qt5-multimedia'
         'qt5-x11extras'
         'sqlcipher'
         'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')

source_x86_64=("${pkgname}-${pkgver}-${_subver}-x86_64.pkg.tar.zst::https://download.opensuse.org/repositories/network:/retroshare/Arch_Community_standard/x86_64/${_pkgname}-gui-${pkgver}-${_subver}-x86_64.pkg.tar.zst"
               "${pkgname}-${pkgver}-${_subver}-x86_64.pkg.tar.zst.sig::https://download.opensuse.org/repositories/network:/retroshare/Arch_Community_standard/x86_64/${_pkgname}-gui-${pkgver}-${_subver}-x86_64.pkg.tar.zst.sig")

b2sums_x86_64=('f0036e6390d22b8a5d85a7ea03f2689f61bcab329fd399c45888650f65cd618e42448d973b9a66be078f7769e8d12e4b51469c2397e19ba6f7d936dfe6f7518e'
               'SKIP')

# Import key with:
# curl -sS https://download.opensuse.org/repositories/network:/retroshare/Arch_Community_standard/x86_64/network_retroshare_Arch_Community_standard.key | gpg --import -
validpgpkeys=('0080689BE757A876CB7DC26962EB1A0917280DDF') # network OBS Project <network@build.opensuse.org>

prepare() {
    sed -i 's/Icon=\/usr\/share\/pixmaps\/retroshare.xpm/Icon=retroshare/' "${srcdir}/usr/share/applications/retroshare.desktop"
}

package() {
    cp -a usr "${pkgdir}"
}
