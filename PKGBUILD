# Maintainer: killab33z <killab33z @ hispagatos-dot-org>
pkgname=usenet_reborn-bin
_pkgname="${pkgname%-bin}"
pkgver=0.2.0
pkgrel=1
pkgdesc="A terminal‑based (TUI) NNTP (Usenet) client written in Rust."
arch=('x86_64')
url="https://git.sr.ht/~rek2/usenet_reborn"
license=(GPL-3.0-only)
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$url/refs/download/$pkgver/usenet_reborn-v$pkgver-x86_64-linux.tar.bz2"
        "$url/blob/main/LICENSE"
        "$url/blob/main/configs/config.toml"
		"$url/blob/main/configs/subscriptions")
sha512sums=('5a9e77d0ad36af13566cf176719d50ac1b8b9493b950726346497a20acfc254a8cf9bde00557c95b62555352957cb5d29e212ff6cbb675280bc24505f52ee6b4'
            '8aecac6cdb63946c456162c1f2cc8074b00045bab44f6bffb9ab01ce305554e92ee6396a282fb69ebcb04caa98b1c279cfff8a6ee1cd7c51df308eedfa1098c4'
            '51120626043782ff26784df0d204bea46151745d82c23a56f14808b2a9c874a995a6fb0ae507fca63c4dbd570b029ce87462bea64f5ff5e3e649eee4054304ce'
            '07e71002af8ee1624bffe1b53b7986220424f55415fb3aba674a5ee194e4acf20dcf1d218f51ccba542f07626b6dedd93ed6ca847b0000f1e7c5a4daa03faffd')
options=(!debug)

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver-linux-$arch" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/$_pkgname" config.toml
  install -Dm644 -t "$pkgdir/usr/share/$_pkgname" subscriptions
}

