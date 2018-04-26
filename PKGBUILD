#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=powerpill
pkgver=2018
pkgrel=1
pkgdesc='Pacman wrapper for faster downloads.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/powerpill"
depends=(aria2 'pm2ml>2012.12.12' pyalpm python3 python3-xcgf python3-xcpf reflector)
optdepends=('python3-threaded_servers: internal Pacserve support' 'rsync: Rsync download support')
backup=(etc/powerpill/powerpill.json)
source=(
  https://xyne.archlinux.ca/projects/powerpill/src/powerpill-2018.tar.xz
  https://xyne.archlinux.ca/projects/powerpill/src/powerpill-2018.tar.xz.sig
)
sha512sums=(
  8d3e433c2010f35efb4890312bf205091b4ab146444cabec7c156814889f3bd64700a0b13a16a65ee1b6cdfacc26539df86f20a67e8f3af48f8913e38b967a3d
  66e186f2c4c149f1ef4c0c012079f7b0337aad3d552a8f5d3e24bf800afa452d793550769589c9f5e3b130ea243c66259ac536d570744b1ff95d1cd9afba18d5
)
md5sums=(
  3298b8ba911bc3b1bcedd882d172f9ca
  83658448189d3bcf218241e4237b06b5
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
