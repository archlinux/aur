#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pm2ml
pkgver=2015.11
pkgrel=1
pkgdesc='Generate metalinks for downloading Pacman packages and databases.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pm2ml"
depends=(python3 pyalpm python3-xcpf)
optdepends=('reflector: Reflector support' 'python3-aur: AUR support' 'aria2: ppl script support.')
backup=(etc/ppl.conf)
source=(
  http://xyne.archlinux.ca/projects/pm2ml/src/pm2ml-2015.11.tar.xz
  http://xyne.archlinux.ca/projects/pm2ml/src/pm2ml-2015.11.tar.xz.sig
)
sha512sums=(
  5dacc480ed14864ee9bf49fbb9d92b9dba4cfaaeb87dbf20357978109ceb2e8d9e28aa494e17b11850c2ccae2849b3090ec488f4d604ad453d9dd564b46d4d81
  0dd67ff31ec94fa23d6379b2a94f8728894d0cb572bd8b62c3bec9459954ac086cf2ba5f4f23c4b08a44cea4a1ef6eb18e58e1916fb5abc44a894bbdb3b56963
)
md5sums=(
  f40a8dafe93eb8adce667fc5d4211d69
  b5bda493b6041faaeee241e810517b7c
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  for foo_ in ppl pplsyu ppls; do
    install -Dm755 "$foo_" "$pkgdir/usr/bin/$foo_"
  done
  install -Dm644 "ppl.conf" "$pkgdir/etc/ppl.conf"
}

# vim: set ts=2 sw=2 et:
