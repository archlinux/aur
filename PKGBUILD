# Maintainer: Markus Möslinger <markus.moeslinger@socra.dev>
pkgname=fzp-bin
pkgver=1.3.1
pkgrel=1
pkgdesc='Fuzzy project selector for git repositories'
arch=('x86_64')
license=('Apache-2.0')
url='https://gitlab.com/socradev/fzp'
depends=(fzf gawk coreutils ncurses eza glow)
provides=('fzp' 'findgit')
conflicts=('fzp' 'fzp-git')
source=("fzp-${pkgver}-${pkgrel}.pkg.tar.zst::https://gitlab.com/socradev/fzp/-/releases/${pkgver}/downloads/packages/fzp-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('b596ea7a615a1f4b604835746e2dd918192c6f79be2f043113681931771a01fa')

package() {
    # Extract the pre-built package directly into pkgdir,
    # excluding pacman metadata files from the source archive.
    tar --zstd -xf "${srcdir}/fzp-${pkgver}-${pkgrel}.pkg.tar.zst" -C "${pkgdir}/" \
        --exclude='.MTREE' \
        --exclude='.PKGINFO' \
        --exclude='.BUILDINFO' \
        --exclude='.INSTALL'
}
