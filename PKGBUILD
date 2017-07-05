#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pbget
pkgver=2017.7
pkgrel=1
pkgdesc='Retrieve PKGBUILDs and local source files from Git, ABS and the AUR for makepkg.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pbget"
depends=(git pm2ml python3 python3-aur python3-xcgf python3-xcpf)
source=(
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2017.7.tar.xz
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2017.7.tar.xz.sig
)
sha512sums=(
  bfaf39316d893887b301de551563526f0e8e3848f78c77fd6546d47a3a141e6a57ebe8f0e6827f7f33000d80da5ef99f2f40ee9f888779d05fe43143e72bde6e
  4ef0ee3f3f605e9fe4e7d58bf40a4acb4789f39cb2d731c5af1e9e3795b9800b2cf8ed8bcdb7be32888e632826025cf8838cda710f40040a2b26618c74cf3d02
)
md5sums=(
  63a8457b4ae67b825b694b6602c2e873
  61c81d3affe9e3088ad7233d7b16dddb
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim: set ts=2 sw=2 et:
