# Maintainer: Arsany Samuel <arsanysamuel.as@gmail.com>
pkgname=stakpak-bin
pkgver=0.2.60
pkgrel=3  # increment this when you make changes to PKGBUILD
pkgdesc="Stakpak is a terminal-native DevOps Agent in Rust 🦀. It can run commands, edit files, search docs, and more. It has security super powers, and generates high quality IaC"
arch=('x86_64' 'aarch64')
url="https://stakpak.dev"
license=('Apache')
depends=('glibc' 'openssl')

# Source URLs for different architectures
source_x86_64=(
    "stakpak-linux-x86_64.tar.gz::https://github.com/stakpak/agent/releases/download/v0.2.60/stakpak-linux-x86_64.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/stakpak/agent/v0.2.60/LICENSE"
    "README.md::https://raw.githubusercontent.com/stakpak/agent/v0.2.60/README.md"
)
source_aarch64=(
    "stakpak-linux-aarch64.tar.gz::https://github.com/stakpak/agent/releases/download/v0.2.60/stakpak-linux-aarch64.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/stakpak/agent/v0.2.60/LICENSE"
    "README.md::https://raw.githubusercontent.com/stakpak/agent/v0.2.60/README.md"
)

# Generated checksums using updpkgsums 
sha256sums_x86_64=('16ba0eae8339327fb40c0072b645545d3f3704bd00da60d1586b5e9e6e8041bf'
                   'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
                   'c838b8c0aaced6799edad85c283a03a087d6355011e651bb5df436c8df6d3632')
sha256sums_aarch64=('2332fabde1832f3e9b1f36fa70f9c1b13475de2254bd765f859b4e77a8307704'
                    'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
                    'c838b8c0aaced6799edad85c283a03a087d6355011e651bb5df436c8df6d3632')

package() {
    # Install the main binary
    install -Dm755 stakpak "${pkgdir}/usr/bin/stakpak"
    
    # Install license and readme (from the source repository)
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    
    # Install man page if available
    if [ -f "stakpak.1" ]; then
        install -Dm644 stakpak.1 "${pkgdir}/usr/share/man/man1/stakpak.1"
    fi
}
