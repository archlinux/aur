# $Id:$
# Contributor: (sirocco AT ngs.ru)
# Maintainer: (sirocco AT ngs.ru)

pkgname=doublecmd-gtk2-alpha-bin
_pkgname=doublecmd
pkgver=1.0.0.svn.r9767
_pkgver=1.0.0~0+svn9767+gitc53082616-1
pkgrel=1
pkgdesc="A file manager with two panels side by side"
arch=('x86_64')
url='https://doublecmd.sourceforge.io'
# https://launchpad.net/~alexx2000/+archive/doublecmd-svn
depends=('gtk2')
optdepends=('lua: scripting' 'p7zip: support for 7zip archives' 'libunrar: support for rar archives'
            'pmount: mount removable devices' 'imagemagick: speed up thumbnail view' 'ffmpegthumbnailer: video thumbnails')
provides=('doublecmd')
replaces=('doublecmd-gtk2-bin-nightly')
conflicts=('doublecmd-gtk2' 'doublecmd-qt5-svn' 'doublecmd-qt5' 'doublecmd-gtk2-svn' 'doublecmd-gtk2-bin-nightly')
license=('GPL2')
options=('!strip')

_bldarch=amd64
# [[ $CARCH = i686 ]] && _bldarch=i386

_url=https://download.opensuse.org/repositories/home:/Alexx2000:/doublecmd-svn/xUbuntu_20.10
source=(${_url}/all/${_pkgname}-common_${_pkgver}_all.deb)
#source_i686+=(${_url}/i386/${_pkgname}-gtk_${_pkgver}_i386.deb
#        ${_url}/i386/${_pkgname}-plugins_${_pkgver}_i386.deb)
source_x86_64+=(${_url}/amd64/${_pkgname}-gtk_${_pkgver}_amd64.deb
        ${_url}/amd64/${_pkgname}-plugins_${_pkgver}_amd64.deb)
sha256sums=('bc091b514d4c70de405af318e5d12a8a3e81af594e299c9421bf80226ddf6cf0')
sha256sums_x86_64=('be5a89eb81205991394ee8a46bdac21cb9df19ffe187f60a86e416e318afc0d0'
                   '21407cfa158b9fe8081d9874ab3d9fe73ed8b76e21917288dab9fab5459948e4')
#sha256sums_i686=('8c37694b5c0623511104d8dc584fb9a904b4368919cd6a2ac5b5cdbef4266f0e'
#                 'd7379824666e9152cd99b02bc626cf6815af096aad2e6e5bf1d99e7c523ccb9c')

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

