# Maintainer: cmulk <cjmulk2@gmail.com>
pkgname=sirikali-bin
_name=SiriKali
pkgver=1.8.1
pkgrel=1
pkgdesc="A Qt/C++ GUI front end to sshfs, ecryptfs-simple, cryfs, gocryptfs, securefs, fscrypt and encfs"
arch=('i686' 'x86_64')
url="https://mhogomchungu.github.io/sirikali/"
license=('GPL')
depends=('qt5-base' 'libpwquality' 'hicolor-icon-theme')
optdepends=('lxqt_wallet: use an external lxqt_wallet (must recompile)'
    'libsecret: support for Gnome libsecret password storage (must recompile)'
    'kwallet5: support for KDE wallet storage (must recompile)'
    'cryfs: for CryFS backend'
    'ecryptfs-simple: for eCryptfs backend'
    'encfs: for EncFS backend'
    'fscrypt: for fscrypt backend'
    'gocryptfs: for gocryptfs backend'
    'securefs: for securefs backend'
    'sshfs: for SSHFS backend')
conflicts=("sirikali-git" "sirikali")
source_x86_64=("https://download.opensuse.org/repositories/home:/obs_mhogomchungu/Debian_12/amd64/sirikali_1.8.1-1_amd64.deb")
sha256sums_x86_64=("1fcbaca9f05fcbc50e396a31ce711ae077be3c9933e807743bc12433f80be18a")
source_i686=("https://download.opensuse.org/repositories/home:/obs_mhogomchungu/Debian_12/i386/sirikali_1.8.1-1_i386.deb")
sha256sums_i686=("ba6013217f7a638001db8ce4088aca06e6d8b254a5c6e2127cf9bd5deddfb73e")

package() {
    cd "$srcdir/"
    tar xaf data.tar.xz -C $pkgdir
    cd $pkgdir/usr/share/applications
    # remove mimetype which causes all folder to open in sirikali
    grep -iv mimetype io.github.mhogomchungu.sirikali.desktop >tmp
    mv -f tmp io.github.mhogomchungu.sirikali.desktop
}
