#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-nist
pkgver=2013.10
pkgrel=2
pkgdesc='Modules for accessing and working with data from the National Institute of Standards and Technology (NIST).'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-nist"
depends=(python3 python3-scinum python-xdg)
optdepends=('python3-tabulator: support for command-line query scripts')
source=(
  http://xyne.archlinux.ca/projects/python3-nist/src/python3-nist-2013.10.tar.xz
  http://xyne.archlinux.ca/projects/python3-nist/src/python3-nist-2013.10.tar.xz.sig
)
sha512sums=(
  8de4d744ae5643882f654509d9db525957e2a9d332d2b46895b0b1a13a61a7cc63060782dd5c903c94af4a2a52c16cb05d5b94d5a7f93f45fba82d1c9edaa015
  9dd0477190a4e687599b5d381a366c4f79fd0664f4379976602d4fa7a9e887fdd913fcb92b8f6c677cd9d11d639a1a92a249837f80a36ec57fe1a75bc061f25e
)
md5sums=(
  819894d46ba3cdcbc07315771d1454a4
  94dad0587262b45efec2b170fe1bc920
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  for script_ in nist-*
  do
    install -Dm755 $script_ "$pkgdir"/usr/bin/$script_
  done
}


# vim: set ts=2 sw=2 et:
