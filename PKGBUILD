# Maintainer: Markus Möslinger <markus.moeslinger@socra.dev>
pkgname=fzp-bin
pkgver=1.4.0
pkgrel=1
pkgdesc='Fuzzy project selector for git repositories'
arch=('x86_64')
license=('Apache-2.0')
url='https://gitlab.com/socradev/fzp'
depends=(fzf gawk coreutils ncurses util-linux eza glow)
provides=('fzp' 'findgit')
conflicts=('fzp' 'fzp-git')
source=("fzp-${pkgver}-${pkgrel}.pkg.tar.zst::https://gitlab.com/socradev/fzp/-/releases/${pkgver}/downloads/packages/fzp-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('bab2086808721743393e5a35b73c68587a14db434b4f74c0a3f3dca85e72393b')

package() {
    # Extract the pre-built package directly into pkgdir,
    # excluding pacman metadata files from the source archive.
    tar --zstd -xf "${srcdir}/fzp-${pkgver}-${pkgrel}.pkg.tar.zst" -C "${pkgdir}/" \
        --exclude='.MTREE' \
        --exclude='.PKGINFO' \
        --exclude='.BUILDINFO' \
        --exclude='.INSTALL'
}
