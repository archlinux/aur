# $Id:$
# Contributor: (sirocco AT ngs.ru)
# Maintainer: (sirocco AT ngs.ru)

pkgname=doublecmd-gtk2-alpha-bin
_pkgname=doublecmd
pkgver=1.0.0.svn.r9784
_pkgver=1.0.0~0+svn9784+gitd54328be4-1
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
sha256sums=('53e1b7108faa31961dd2d6968acdb04a904797d7e728c965c69b881bd8dbc9a5')
sha256sums_x86_64=('623a66420178b864e7763fa7e9476ee00377f91d2430f57b26809267e2f6a241'
                   'acd8f469fbaf6e1c5ae79a66af8b6b71ccf4f61c8b22e1442e569b900d69fc97')
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

