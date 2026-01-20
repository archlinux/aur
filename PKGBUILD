# Maintainer: Julian Yaman <mail at yaman dot pro>
# Contributor: Julian Yaman <mail at yaman dot pro>

pkgname=cryptofetch
pkgver=1.0.1
pkgrel=1
pkgdesc="A neofetch-style terminal application for displaying cryptocurrency prices and stats"
arch=('x86_64' 'aarch64')
url="https://github.com/julianYaman/cryptofetch"
license=('MIT')
depends=()
makedepends=()
provides=('cryptofetch')
conflicts=('cryptofetch')
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/cryptofetch-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/cryptofetch-linux-arm64")
sha256sums_x86_64=('98d2976f158a2736afd67c4ecc265f278e0afc3110e74207a9c653fd48e7cee0') 
sha256sums_aarch64=('52d589158d148a37686a0c8fbf02238109a2be9eeec5938d65cef7c39fc5b4c0')

# To generate checksums after release:
# updpkgsums

package() {
    # Install binary
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Testing instructions:
# 1. Update pkgver to match your release version
# 2. Run: updpkgsums  (to generate SHA256 checksums)
# 3. Run: makepkg -si  (to build and install locally)
# 4. Test: cryptofetch --help
# 5. Test: cryptofetch --cur bitcoin
#
# Publishing to AUR:
# 1. Create AUR account at https://aur.archlinux.org
# 2. Add SSH key to AUR account
# 3. Clone AUR repo: git clone ssh://aur@aur.archlinux.org/cryptofetch.git
# 4. Copy this PKGBUILD to the cloned directory
# 5. Generate .SRCINFO: makepkg --printsrcinfo > .SRCINFO
# 6. Commit: git add PKGBUILD .SRCINFO && git commit -m "Initial commit"
# 7. Push: git push
#
# Updating for new releases:
# 1. Update pkgver
# 2. Run: updpkgsums
# 3. Run: makepkg --printsrcinfo > .SRCINFO
# 4. Test: makepkg -si
# 5. Commit and push to AUR
