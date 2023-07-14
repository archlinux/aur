# Maintainer: cmulk <cjmulk2@gmail.com>
pkgname=sirikali-bin
_name=SiriKali
pkgver=1.5.1
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
source_x86_64=("https://download.opensuse.org/repositories/home:/obs_mhogomchungu/Debian_11/amd64/sirikali_1.5.1.1688973427.9f25031-0_amd64.deb")
sha256sums_x86_64=('1cde7921d52d377eedd83a480c93fa119bc26fac93b0b04557c84cf788a996fc')
source_i686=("https://download.opensuse.org/repositories/home:/obs_mhogomchungu/Debian_11/i386/sirikali_1.5.1.1688973427.9f25031-0_i386.deb")
sha256sums_i686=('484ef71e1ffe906bca666930198e4e44b69380cb32613124323a135fdd5a9389')

package() {
    cd "$srcdir/"
    tar xaf data.tar.xz -C $pkgdir
    cd $pkgdir/usr/share/applications
    # remove mimetype which causes all folder to open in sirikali
    grep -iv mimetype io.github.mhogomchungu.sirikali.desktop >tmp
    mv -f tmp io.github.mhogomchungu.sirikali.desktop
}
