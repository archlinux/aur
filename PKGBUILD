# $Id:$
# Contributor: (sirocco AT ngs.ru)
# Maintainer: (sirocco AT ngs.ru)

pkgname=doublecmd-gtk2-alpha-bin
_pkgname=doublecmd
pkgver=0.8.0.svn.r7638
_pkgver=0.8.0~0+svn7638-0
pkgrel=1
pkgdesc="A file manager with two panels side by side"
arch=('i686' 'x86_64')
url='https://doublecmd.sourceforge.io'
# https://launchpad.net/~alexx2000/+archive/doublecmd-svn
depends=('gtk2')
optdepends=('lua51: scripting' 'p7zip: support for 7zip archives' 'libunrar: support for rar archives'
            'pmount: mount removable devices' 'imagemagick: speed up thumbnail view' 'ffmpegthumbnailer: video thumbnails')
provides=('doublecmd')
replaces=('doublecmd-gtk2-bin-nightly')
conflicts=('doublecmd-gtk2' 'doublecmd-qt-svn' 'doublecmd-qt' 'doublecmd-gtk2-svn' 'doublecmd-gtk2-bin-nightly')
license=('GPL2')
options=('!strip')

_bldarch=amd64
[[ $CARCH = i686 ]] && _bldarch=i386

_url=http://download.opensuse.org/repositories/home:/Alexx2000:/doublecmd-svn/xUbuntu_17.04
source=(${_url}/all/${_pkgname}-common_${_pkgver}_all.deb)
source_i686+=(${_url}/i386/${_pkgname}-gtk_${_pkgver}_i386.deb
        ${_url}/i386/${_pkgname}-plugins_${_pkgver}_i386.deb)
source_x86_64+=(${_url}/amd64/${_pkgname}-gtk_${_pkgver}_amd64.deb
        ${_url}/amd64/${_pkgname}-plugins_${_pkgver}_amd64.deb)
sha256sums=('6ec12b282841c061982fc55a0b6b824e8ba5e721c7490c424ea1bd6b1e6d9b0a')
sha256sums_i686=('c103e7c2ee1b61851abf09014c223646f76ec6fcb66e3f81e49fa9c8989ea87a'
                 '85e66759d7c580a0b782f2a6a6668136e8a805e05b3b3ad3b3d5ebe20f571c63')
sha256sums_x86_64=('ddcf115ddb2984d13a949b24ef3932e851000e0089574ed4996ae67570f5792e'
                   '0600c3173e3271654688c5e3db3a7ea82129e54fa4231cd2ca377b18720d512e')

noextract=(
   ${_pkgname}-gtk_${_pkgver}_${_bldarch}.deb
   ${_pkgname}-plugins_${_pkgver}_${_bldarch}.deb
   ${_pkgname}-common_${_pkgver}_all.deb
)



package() {
    msg2 "Extracting files..."
    cd "$srcdir"
    ar x ${_pkgname}-gtk_${_pkgver}_${_bldarch}.deb
    tar xf data.tar.xz --exclude lintian -C $pkgdir
    rm -f data.tar.xz
    ar x ${_pkgname}-plugins_${_pkgver}_${_bldarch}.deb
    tar xf data.tar.xz --exclude lintian -C $pkgdir
    rm -f data.tar.xz
    ar x ${_pkgname}-common_${_pkgver}_all.deb
    tar xf data.tar.xz --exclude lintian -C $pkgdir
    rm -f data.tar.xz

}

