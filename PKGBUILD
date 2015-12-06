#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=powerpill
pkgver=2015.12.6
pkgrel=1
pkgdesc='Pacman wrapper for parallel and segmented downloads.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/powerpill"
depends=(aria2 'pm2ml>2012.12.12' pyalpm python3 python3-xcgf python3-xcpf reflector)
optdepends=('python3-threaded_servers: internal Pacserve support' 'rsync: Rsync download support')
backup=(etc/powerpill/powerpill.json)
source=(
  http://xyne.archlinux.ca/projects/powerpill/src/powerpill-2015.12.6.tar.xz
  http://xyne.archlinux.ca/projects/powerpill/src/powerpill-2015.12.6.tar.xz.sig
)
sha512sums=(
  54d9cd9ed57750314f12950f932c73b879447f1252535bd82c2080c7118390fc67ef093108749ba237617d60698cecc46e99b0593affdf923d6c4c4b24043873
  08aedd26242ba57fcb36d4b3114d8e8e905319392908cdaaa819e028a3cc36349d493b8f2076ae61ac181810cc397b8545ac8f3e378f3adbfb1de5bc6b82346a
)
md5sums=(
  f0e2fd8a14ae0b761e159e697724d722
  5a75bf52b8f02aaa81c4fa97ec41a225
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
