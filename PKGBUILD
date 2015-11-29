# Maintainer: Simon Kohlmeyer <simon.kohlmeyer@googlemail.com>
pkgname=rbenv-binstubs
pkgver=1.0.0_76479aa
_commit_sha1="${pkgver##*_}"
pkgrel=1
epoch=
pkgdesc="This rbenv plugin automatically runs rbenv rehash every time you install or uninstall a gem"
arch=('any')
url="https://github.com/rbenv/rbenv-gem-rehash"
license=('custom:MIT')
groups=()
depends=('rbenv')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "https://github.com/ianheggie/rbenv-binstubs/tarball/$_commit_sha1"
    "LICENSE"
)
noextract=()
sha512sums=('e79960d02501c98a834b9f3d8eb9b10985996adaf6c0895390e6f6bedebfc6dcf3e20dcf17d172969885100549dd75d9f292efa97e93be9825f3573049559307'
            '2543d15dfdded6e42c36bc1a2ccfe593766bca01c82e3f4bfe5297b5050bf542defed8a7937cc93f2a6cc0fd35c5f6458e850e9f19a3a13102be5a3ba2045b1a')
validpgpkeys=()

package() {
    license_dir="$pkgdir/usr/share/licenses/${pkgname}/"
    mkdir -p "$license_dir"
    cp --preserve=mode "$srcdir/LICENSE" "$license_dir/LICENSE"

    rbenv="$pkgdir/usr/lib/rbenv"
    bindir="$rbenv/libexec"
    hookdir="$rbenv/hooks"

    cd "ianheggie-rbenv-binstubs-${_commit_sha1}"

    mkdir -p "$bindir"
    cp --preserve=mode bin/rbenv-bundles "$bindir/rbenv-bundles"

    mkdir -p "$hookdir"
    cp -r --preserve=mode etc/rbenv.d/* "$hookdir/"
}
