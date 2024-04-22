# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>

pkgdesc='A pseudo-random password generator'
pkgname=pswd
pkgver=3.1.0
pkgrel=3
arch=(any)
license=(MIT)
depends=(python)
url=https://github.com/dwaring87/pswd
source=("${url}/archive/v${pkgver}.tar.gz" pswd-py3.diff)
sha512sums=('d1b84bb3760d79c3e62558e6bed87c65c86d78ac4d0b3665b93f3986a7592ef5ce1889aecd7783993518bfad61b3a79c200d7798ddf7bf6810521b49eb0c3b0c'
            '7f353f42fb9692b076ac626d4f49e0ed57504216afef9d49264f14e22d19af629c89d1b2a9b0bc369cf1d6c4a8e162089a8446e7c307569b51ed455c18f9311d')

prepare () {
	patch -i"$srcdir/pswd-py3.diff" "$pkgname-$pkgver/python/pswd"
}

package () {
	cd "$pkgname-$pkgver/python"
	install -Dm755 pswd "$pkgdir/usr/bin/pswd"
}
