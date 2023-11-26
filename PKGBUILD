# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>

pkgname=retroshare-bin
_pkgname=retroshare
pkgver='0.6.7'
_subver='20231116'
pkgrel=1
pkgdesc='Serverless encrypted instant messenger with filesharing, chatgroups, e-mail.'
arch=('x86_64')
url='https://retroshare.cc/'
license=('AGPL' 'GPL' 'LGPL')
depends=('bzip2' 'libupnp' 'libxss' 'openssl-1.1' 'qt5-multimedia' 'qt5-x11extras' 'sqlcipher')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')

source_x86_64=("${pkgname}-${pkgver}-${_subver}-x86_64.pkg.tar.zst::https://download.opensuse.org/repositories/network:/retroshare/Arch_Community_standard/x86_64/${_pkgname}-gui-${pkgver}-${_subver}-x86_64.pkg.tar.zst"
               "${pkgname}-${pkgver}-${_subver}-x86_64.pkg.tar.zst.sig::https://download.opensuse.org/repositories/network:/retroshare/Arch_Community_standard/x86_64/${_pkgname}-gui-${pkgver}-${_subver}-x86_64.pkg.tar.zst.sig")

b2sums_x86_64=('4f300f6c27df5afad4fe41cbfdd687d7f024e5d5213acadae7f42e5aaa225d16a1dbd8692f01c5dd641d8e181d5740e43f387034158c1e251989f60f53460f26'
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
