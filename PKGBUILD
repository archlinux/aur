# Maintainer: larte <lauri.arte@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=draft-bin
pkgdesc="Draft client"
pkgver=0.12.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://draft.sh"
license=('mit')
conflicts=()
_draft_file=draft-$pkgver
source_i686=($_draft_file::https://azuredraft.blob.core.windows.net/draft/draft-v0.12.0-linux-386.tar.gz )
source_x86_64=($_draft_file::https://azuredraft.blob.core.windows.net/draft/draft-v0.12.0-linux-amd64.tar.gz )
md5sums_i686=('881357a46bdf86111993b1c364f786cd')
md5sums_x86_64=('4e2ff8680952e82efce23b6bea8802b4')

package() {
  FOLDER="linux-386"
  if [[ $CARCH -eq 'x86_64' ]];
  then
    FOLDER="linux-amd64"
  fi

  install -Dm 755 "$srcdir/$FOLDER/draft" "$pkgdir/usr/bin/draft"
}
