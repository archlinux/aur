# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot net>

pkgname=retroshare-bin
_pkgname=retroshare
pkgver='0.6.6'
_subver='20210324'
pkgrel=1
pkgdesc='Serverless encrypted instant messenger with filesharing, chatgroups, e-mail.'
arch=('x86_64')
url='https://retroshare.cc/'
license=('AGPL' 'GPL' 'LGPL')
depends=('bzip2' 'libupnp' 'libxss' 'openssl-1.1' 'qt5-multimedia' 'qt5-x11extras' 'sqlcipher')
provides=("${_pkgname}" "${_pkgname}-gui" "${_pkgname}-git")
conflicts=("${_pkgname}" "${_pkgname}-gui" "${_pkgname}-git")
options=('!strip')

source_x86_64=("${pkgname}-${pkgver}-${_subver}-x86_64.pkg.tar.zst::https://download.opensuse.org/repositories/network:/retroshare/Arch_Community_standard/x86_64/${_pkgname}-gui-${pkgver}-${_subver}-x86_64.pkg.tar.zst"
               "${pkgname}-${pkgver}-${_subver}-x86_64.pkg.tar.zst.sig::https://download.opensuse.org/repositories/network:/retroshare/Arch_Community_standard/x86_64/${_pkgname}-gui-${pkgver}-${_subver}-x86_64.pkg.tar.zst.sig")

b2sums_x86_64=('31596d898a7e918e994b52426c156a231a6a78417df1af7ad950abf5a30a21035d0ead0f3c4b0087bbb9128d8d08c6f027b515b971a1e6a29a909cfa5de79dda'
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
