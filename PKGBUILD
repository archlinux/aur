# Maintainer: cmulk <cjmulk2@gmail.com>
pkgname=sirikali-bin
_name=SiriKali
pkgver=1.4.8
pkgrel=1
pkgdesc="A Qt/C++ GUI front end to sshfs, ecryptfs-simple, cryfs, gocryptfs, securefs, fscrypt and encfs"
arch=('i686' 'x86_64')
url="https://mhogomchungu.github.io/sirikali/"
license=('GPL')
depends=('qt5-base' 'libpwquality' 'hicolor-icon-theme')
optdepends=('lxqt_wallet: use an external lxqt_wallet (must recompile)'
    'libsecret: support for Gnome libsecret password storage (must recompile)'
    'kwallet: support for KDE wallet storage (must recompile)'
    'cryfs: for CryFS backend'
    'ecryptfs-simple: for eCryptfs backend'
    'encfs: for EncFS backend'
    'fscrypt: for fscrypt backend'
    'gocryptfs: for gocryptfs backend'
    'securefs: for securefs backend'
    'sshfs: for SSHFS backend')
conflicts=("sirikali-git" "sirikali")
source_x86_64=("https://download.opensuse.org/repositories/home:/obs_mhogomchungu/Debian_10/amd64/sirikali_1.4.8.1606827786.1157fe1-0_amd64.deb")
sha256sums_x86_64=('98b6203e6142c8838865ec4ace27641a55d76e39c8aef9f2dfe71972a01c5514')
source_i686=("https://download.opensuse.org/repositories/home:/obs_mhogomchungu/Debian_10/i386/sirikali_1.4.8.1606827786.1157fe1-0_i386.deb")
sha256sums_i686=('5a29181e05a577d9121cdfd42dbbaca998d50a17d3846b040d1d7c5fa5203613')

package() {
    cd "$srcdir/"
    tar xaf data.tar.xz -C $pkgdir
    cd $pkgdir/usr/share/applications
    # remove mimetype which causes all folder to open in sirikali
    grep -iv mimetype io.github.mhogomchungu.sirikali.desktop >tmp
    mv -f tmp io.github.mhogomchungu.sirikali.desktop
}
