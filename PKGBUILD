#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=powerpill
pkgver=2015.12.8
pkgrel=1
pkgdesc='Pacman wrapper for parallel and segmented downloads.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/powerpill"
depends=(aria2 'pm2ml>2012.12.12' pyalpm python3 python3-xcgf python3-xcpf reflector)
optdepends=('python3-threaded_servers: internal Pacserve support' 'rsync: Rsync download support')
backup=(etc/powerpill/powerpill.json)
source=(
  http://xyne.archlinux.ca/projects/powerpill/src/powerpill-2015.12.8.tar.xz
  http://xyne.archlinux.ca/projects/powerpill/src/powerpill-2015.12.8.tar.xz.sig
)
sha512sums=(
  027f2db069ee3873a978c49f9160c746c5adceeaa0af973e444b0cc3c4a4cf4279c0cd684b1938e5b3e713a6381902c86d795009dc3ff7c9e8d488e7af84452e
  9a04d8739d82e47109ddd3bd100aa98c03cc6d2ef314f6e5e104f5d71f8b0ac6dbf589bf1c0482f9f9e94b1f47071268bb0a6b18205bfed9c561717d4714e10d
)
md5sums=(
  d983c1e29cec63834520802d5d2be34d
  73795164e9266eb1123a3c039b013540
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "powerpill" "$pkgdir/usr/bin/powerpill"
  install -Dm644 "powerpill.json" "$pkgdir/etc/powerpill/powerpill.json"
  install -Dm644 "man/powerpill.json.1.gz" "$pkgdir/usr/share/man/man1/powerpill.json.1.gz"
  install -Dm644 "powerpill-bash-completion.sh" "$pkgdir/usr/share/bash-completion/completions/powerpill"
}

# vim: set ts=2 sw=2 et:
