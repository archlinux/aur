#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2015.12.6.2
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.6.2.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.6.2.tar.xz.sig
)
sha512sums=(
  e0da23b37f0b87cf5f84391e3ff89a957a9b7eddb8eca4d29960bc240b9cde75eb528a7553ecacd9002408d777d2ce0374c4bc19362272851c4d8acdb0e7730c
  c1c645251377bd89d163f239111007cd6490204d368ab16a1b232ee888f2fb8d3aba4e1dc8d2025511f074d675cf8daad65b73d719d1a9b936333f10154a7f77
)
md5sums=(
  88bbf01f8fc197c7b93a55620774b671
  e911f4a4508469e9bfee6efe533885be
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 "bauerbill.json" "$pkgdir/etc/bauerbill/bauerbill.json"
  install -Dm644 "man/bauerbill.json.1.gz" "$pkgdir/usr/share/man/man1/bauerbill.json.1.gz"
  install -Dm644 "bauerbill-bash-completion.sh" "$pkgdir/usr/share/bash-completion/completions/bauerbill"
  for bb in bauerbill bb-*
  do
    if [[ -x $bb ]]
    then
      install -Dm755 "$bb" "$pkgdir/usr/bin/$bb"
    fi
  done
}

# vim: set ts=2 sw=2 et:
