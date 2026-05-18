# Maintainer: Parth Gajjar <your-email@example.com>
pkgname=toss-api-bin
_pkgname=toss-api
pkgver=0.1.3             # Change this to match your current GitHub release tag
pkgrel=1
pkgdesc="A Vim-inspired TUI API client"
arch=('x86_64')
url="https://github.com/ghostp13409/toss"  # Replace with your actual GitHub repo URL
license=('GPL-3.0')          # Change if you use a different license (e.g., 'Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

# Point to the exact asset URL that cargo-dist uploaded to your GitHub release
source=("https://github.com/ghostp13409/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.xz")

# Leave this as 'SKIP' for a brief second; we will auto-generate this hash in Step 2
sha256sums=('c9fbd0af157aef6995612a0412bfd8a5931957dfe557db670c1ca33e6ac01f45')

package() {
    # Extract the binary from the tar.gz and install it to /usr/bin/toss-api
    # cargo-dist usually nests the binary inside a folder matching the archive name
    install -Dm755 "${srcdir}/${_pkgname}-x86_64-unknown-linux-gnu/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
