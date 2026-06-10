# Maintainer: KeychainPGP Contributors

pkgname=keychainpgp-bin
pkgver=0.2.3
pkgrel=1
pkgdesc='Clipboard-first PGP encryption for desktop & Android (prebuilt binary)'
arch=('x86_64')
url='https://github.com/KeychainPGP/keychainpgp'
license=('MIT' 'Apache-2.0')
depends=('webkit2gtk-4.1' 'gtk3' 'libsecret' 'openssl' 'libsoup3' 'glibc' 'gcc-libs' 'hicolor-icon-theme' 'glib2')
provides=('keychainpgp')
conflicts=('keychainpgp' 'keychainpgp-git')
source=("https://github.com/KeychainPGP/keychainpgp/releases/download/v$pkgver/KeychainPGP_${pkgver}_amd64.deb"
        "LICENSE-MIT::https://raw.githubusercontent.com/KeychainPGP/keychainpgp/v$pkgver/LICENSE-MIT"
        "LICENSE-APACHE::https://raw.githubusercontent.com/KeychainPGP/keychainpgp/v$pkgver/LICENSE-APACHE")
sha256sums=('1b3f48355b9a67e9865591ef4060157aa94593214825754c42dbdf3a179468db'
            'b051a8d5d50cf1e051a2180a63c1793644a20bc510690cba174a6bf1ea17b469'
            '4edeb7502f75a387e727d9c99d5c96e5cc687808aa2eb8e9e629b32dd6614738')

package() {
  # Extract the Debian package contents
  tar -xvf data.tar.* -C "$pkgdir"
  
  # Install licenses
  install -Dm0644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm0644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
