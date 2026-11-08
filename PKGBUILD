# Maintainer: Geoff Jukes <geoff@geoffjay.com>
# PKGBUILD for tower-bin — binary package sourcing the release tarball from
# GitHub. Regenerated per release by scripts/gen-aur-pkgbuild.sh (URLs and
# checksums are substituted verbatim; the checked-in template is never
# modified by hand per-release).
#
# See docs/knowledgebase/concepts/releases.md for the release workflow.
pkgname=tower-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Control and visibility for herds of coding agents"
arch=("aarch64" "x86_64")
url="https://github.com/geoffjay/tower"
license=("MIT" "Apache-2.0")
provides=("tower")
conflicts=("tower" "tower-git")

# The local filename is version-qualified. The upstream tarball name is the
# same in every release; makepkg/AUR helpers reuse an existing file of the
# same name from SRCDEST or the helper's cache, so a bare name makes the next
# upgrade fail the checksum with "One or more files did not pass the validity
# check!".
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/geoffjay/tower/releases/download/v0.9.0/tower-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('f25ab79c85411da5fe9ee71876b928bb42852f3e317f1a8f8bd9937d58bdf92d')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/geoffjay/tower/releases/download/v0.9.0/tower-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c630a71a831e9788c28fab07f75464fb6b21ebd988832abea4887a6e8df19247')

package() {
    install -Dm755 "tower" "${pkgdir}/usr/bin/tower"
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
