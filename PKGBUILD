# Maintainer: Cynthia Rey <cynthia+aur@cynthia.dev>
# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

pkgname=vmaware-bin
pkgver=2.8.1
pkgrel=1
pkgdesc='Advanced VM detection library and tool'
url='https://github.com/NotRequiem/VMAware'
arch=('x86_64')
depends=(
	glibc
	libgcc
	libstdc++
)
conflicts=('vmaware')
provides=('vmaware')
license=('MIT')

source=(
	"https://github.com/NotRequiem/VMAware/releases/download/v$pkgver/vmaware.hpp"
	"https://github.com/NotRequiem/VMAware/releases/download/v$pkgver/vmaware_linux_amd64"
	"LICENSE.$pkgname::https://raw.githubusercontent.com/NotRequiem/VMAware/refs/tags/v$pkgver/LICENSE"
)

b2sums=('e15f900ab8734910be53eb18f1dd718dce34845dac294555b950fd2cc80c4fd2510d5ce6d55cf06ce9a96515d01bbb7949877d84d966ee6bca43fe62cedbc944'
        'e8c990c607540dcda7147e32ee25070394331933294ea0c050f95a2bb2a4efe012af6905d2c938386679bdbb7b08c27cd9ff8644ce68f3b8d10633e6b497d07d'
        'a128d466b2cb462a57c836edc98bdcad455c1b443d5ff71b9e271f6f3f0ced730e1a879d182e275a614fd226f739752c4577fe3f4fb4ae97894482f1ca77a13b')

package() {
	install -Dm755 "$srcdir/vmaware_linux_amd64" "$pkgdir/usr/bin/vmaware"
	install -Dm644 "$srcdir/vmaware.hpp" "$pkgdir/usr/include/vmaware.hpp"
	install -Dm644 "$srcdir/LICENSE.$pkgname" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
