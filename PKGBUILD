# Maintainer: Markus Möslinger <markus.moeslinger@socra.dev>
pkgname=fzp-bin
pkgver=1.3.5
pkgrel=1
pkgdesc='Fuzzy project selector for git repositories'
arch=('x86_64')
license=('Apache-2.0')
url='https://gitlab.com/socradev/fzp'
depends=(fzf gawk coreutils ncurses util-linux eza glow)
provides=('fzp' 'findgit')
conflicts=('fzp' 'fzp-git')
source=("fzp-${pkgver}-${pkgrel}.pkg.tar.zst::https://gitlab.com/socradev/fzp/-/releases/${pkgver}/downloads/packages/fzp-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('20c8f2fe3c251a9b9be7939dea2c853026de431ad9af485e5baf6201496eb5c9')

package() {
    # Extract the pre-built package directly into pkgdir,
    # excluding pacman metadata files from the source archive.
    tar --zstd -xf "${srcdir}/fzp-${pkgver}-${pkgrel}.pkg.tar.zst" -C "${pkgdir}/" \
        --exclude='.MTREE' \
        --exclude='.PKGINFO' \
        --exclude='.BUILDINFO' \
        --exclude='.INSTALL'
}
