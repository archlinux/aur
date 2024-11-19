# Maintainer: aarto <aarto@archlinux.org>
pkgname=mtracker-bin
_pkgname=mtracker
pkgver=0.5.0
pkgrel=1
pkgdesc='cli movie tracker - keep track of watched movies and series'
url='https://github.com/r-unruh/mtracker'
license=('MIT')
arch=('x86_64')
provides=('mtracker')
conflicts=('mtracker')
source=("https://github.com/r-unruh/mtracker/releases/download/v$pkgver/$_pkgname-$arch-unknown-linux-gnu.tar.gz"
        "https://raw.githubusercontent.com/r-unruh/mtracker/refs/tags/v$pkgver/LICENSE"
        "https://raw.githubusercontent.com/r-unruh/mtracker/refs/tags/v$pkgver/completions/bash"
        "https://raw.githubusercontent.com/r-unruh/mtracker/refs/tags/v$pkgver/completions/zsh")
b2sums_x86_64=('89990a537b011495cb2374f39fe74b793adc1949e3d34f7be4b55f8fefc2b5ce9124b5cc116dd26f9a010581b7a3fde07640c23812e12de6871fda8a2ffbf338'
        'adc18026f965ed2dc8a5414d72af7f0e2e37ce4978e42bb9004e65399f6e3b61330f1ae8174d98747ea15f061d97d8c42a68327b9f8957659dd5216881e72ffc'
        '7de3668bc45fe13268a37f30f84d15b1ef9a0c5fc230855d12833f2f77249d39f456299e93af101d5e672e93e5eec0a4f10dd94fdcd2ec0197c45fb325e538e3'
        '9633bcb7db3801f6303f08d5d82c80627977fb84e3bc036d7fedffb6dafcc910575f1ade700c4e6e2663f8ae997855ecab7df3c6d33550ef208fe7e7ab42100a')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" $_pkgname
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Shell autocompletion scripts
    install -Dm644 bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
