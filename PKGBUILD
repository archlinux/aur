# Maintainer: Ayush Agarwal <ayushnix at fastmail dot com>

pkgname=pass-tessen
pkgver=2.0.1
pkgrel=1
pkgdesc="fuzzy data selection and copy-paste from password store"
arch=(any)
url="https://git.sr.ht/~ayushnix/pass-tessen"
license=('GPL2')
depends=('pass')
optdepends=(
            'fzf: supported fuzzy selection backend'
            'skim: supported fuzzy selection backend'
            'fzy: supported fuzzy selection backend'
            'wl-clipboard: to copy text in wayland'
            'xclip: to copy text in xorg'
            'xdg-utils: to open URLs in default web browser'
            'pass-otp: to generate and copy OTPs')
conflicts=('pass-tessen-git')
source=("$url/refs/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('83ae103ba8c21018b104f748716240724a0a56d7ede4773fef31c6e77c20d0d7')
install=pass-tessen.install

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
