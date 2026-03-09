# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: cmulk <cjmulk2@gmail.com>

_name=SiriKali
pkgname=sirikali-bin
pkgver=1.8.6
pkgrel=2
_version=${pkgver}-1
pkgdesc="A Qt/C++ GUI front end to sshfs, ecryptfs-simple, cryfs, gocryptfs, securefs, fscrypt and encfs"
arch=('x86_64' 'i686')
url="https://mhogomchungu.github.io/sirikali/"
license=('GPL-3.0')

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

source_x86_64=("https://download.opensuse.org/repositories/home:/obs_mhogomchungu/Debian_12/amd64/sirikali_${_version}_amd64.deb")
source_i686=("https://download.opensuse.org/repositories/home:/obs_mhogomchungu/Debian_12/i386/sirikali_${_version}_i386.deb")
sha256sums_x86_64=('4309e44ea32379ce2722223dd6d2a37389a57f1d95bc5dc0e4b29d64929316b2')
sha256sums_i686=('2f4d568dca27be82133a144aa000261164b0ea7ec5a7982bb70944846849a963')

package() {
    cd "${srcdir}/"

    tar xaf data.tar.xz -C ${pkgdir}
    cd ${pkgdir}/usr/share/applications

    # remove mimetype which causes all folder to open in sirikali
    grep -iv mimetype io.github.mhogomchungu.sirikali.desktop >tmp
    mv -f tmp io.github.mhogomchungu.sirikali.desktop
}
