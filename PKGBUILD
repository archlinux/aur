#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=powerpill
pkgver=2015.10.6.1
pkgrel=1
pkgdesc='Pacman wrapper for parallel and segmented downloads.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/powerpill"
depends=(python3 pyalpm 'pm2ml>2012.12.12' reflector aria2 python3-xcpf)
optdepends=('python3-threaded_servers: internal Pacserve support' 'rsync: Rsync download support')
backup=(etc/powerpill/powerpill.json)
source=(
  http://xyne.archlinux.ca/projects/powerpill/src/powerpill-2015.10.6.1.tar.xz
  http://xyne.archlinux.ca/projects/powerpill/src/powerpill-2015.10.6.1.tar.xz.sig
)
sha512sums=(
  7122243014563800c212f107bc2b3deb1ab614dd607d40ecfcbac5bc6276fce657829bd33f696e9af34308472b6d847f9a552e083bb7699ad00f9a905ba86cf6
  5cdeaab3619f709f79c98d717e2228cc1478696cd5b2f570f8e4ebd4a6bc51a0565acefefca58a67eb11106af327411c42be177194f68be98223c2b3e2b3bee3
)
md5sums=(
  39710245c5f82cfb32c9d3c6291c6799
  0aaad05cd9c0e735b7130fff07eb1992
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
