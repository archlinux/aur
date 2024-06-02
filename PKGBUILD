# Maintainer: cmulk <cjmulk2@gmail.com>
pkgname=sirikali-bin
_name=SiriKali
pkgver=1.6.0
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
source_x86_64=("https://download.opensuse.org/repositories/home:/obs_mhogomchungu/Debian_12/amd64/sirikali_1.6.0-1_amd64.deb")
sha256sums_x86_64=('4257a950dcd21012d76d3c254aab7efee81caf5cc9b7247e143539de3da70797')
source_i686=("https://download.opensuse.org/repositories/home:/obs_mhogomchungu/Debian_12/i386/sirikali_1.6.0-1_i386.deb")
sha256sums_i686=('8a8cf3d7884ee473ea3d6f7063432d7080564397ff08c400c7ec3ab442891158')

package() {
    cd "$srcdir/"
    tar xaf data.tar.xz -C $pkgdir
    cd $pkgdir/usr/share/applications
    # remove mimetype which causes all folder to open in sirikali
    grep -iv mimetype io.github.mhogomchungu.sirikali.desktop >tmp
    mv -f tmp io.github.mhogomchungu.sirikali.desktop
}
