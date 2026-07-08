# Maintainer: Cynthia Rey <cynthia+aur@cynthia.dev>
# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

pkgname=vmaware-bin
pkgver=2.8.0
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
	"https://github.com/NotRequiem/VMAware/releases/download/v$pkgver/vmaware_linux"
	"LICENSE.$pkgname::https://raw.githubusercontent.com/NotRequiem/VMAware/refs/tags/v$pkgver/LICENSE"
)

b2sums=('0443a0793ad53b3e314744db28703ff952e8c313a22099b532c2e53aca1d83433946c91397b83facad76ae9db2d4d4e8dbce358f3f5510d5fbe0001d7aeb1275'
        'c945885cc56521905a52554e1e957a1e6d87fb68217273e027f44a451427cd9ef3f67c93f46931dc0e9602a57501c58aa901995dbb25346ccdfb87d2c85ae07e'
        'a128d466b2cb462a57c836edc98bdcad455c1b443d5ff71b9e271f6f3f0ced730e1a879d182e275a614fd226f739752c4577fe3f4fb4ae97894482f1ca77a13b')

package() {
	install -Dm755 "$srcdir/vmaware_linux" "$pkgdir/usr/bin/vmaware"
	install -Dm644 "$srcdir/vmaware.hpp" "$pkgdir/usr/include/vmaware.hpp"
	install -Dm644 "$srcdir/LICENSE.$pkgname" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
