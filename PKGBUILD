#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=powerpill
pkgver=2015.12.6.2
pkgrel=1
pkgdesc='Pacman wrapper for parallel and segmented downloads.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/powerpill"
depends=(aria2 'pm2ml>2012.12.12' pyalpm python3 python3-xcgf python3-xcpf reflector)
optdepends=('python3-threaded_servers: internal Pacserve support' 'rsync: Rsync download support')
backup=(etc/powerpill/powerpill.json)
source=(
  http://xyne.archlinux.ca/projects/powerpill/src/powerpill-2015.12.6.2.tar.xz
  http://xyne.archlinux.ca/projects/powerpill/src/powerpill-2015.12.6.2.tar.xz.sig
)
sha512sums=(
  6a1f08644ee7c0809c703ccbcce7ed98d2c435880db514ca99c9069e22652a9a906f43f5fc28ba382fa57bac46924f9c0540022af60191db12f355a53f41c492
  53d5edc40bc517b752c6ea2ff76ec34ab359c40aef8561af1a4efc331d48c2fbab551312155010ade6f83662cd4e88f2b5f3cb40f7eaf4d3d4f23da213595de1
)
md5sums=(
  d564a3a94d0f7b695ad07d0633b772b5
  32cbaaa484829cc7895f131b2dc64b1c
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
