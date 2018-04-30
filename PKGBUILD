# Maintainer: larte <lauri.arte@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=draft-bin
pkgdesc="Draft client"
pkgver=0.14.1
pkgrel=1
arch=('i686' 'x86_64')
url="http://draft.sh"
license=('mit')
conflicts=()
_draft_file=draft-$pkgver
source_i686=($_draft_file::https://azuredraft.blob.core.windows.net/draft/draft-v0.14.1-linux-386.tar.gz )
source_x86_64=($_draft_file::https://azuredraft.blob.core.windows.net/draft/draft-v0.14.1-linux-amd64.tar.gz )
md5sums_i686=('f951f980762ead7eea1de2e98034cfc7')
md5sums_x86_64=('432f14fce8c2382335730194772bcca5')

package() {
  FOLDER="linux-386"
  if [[ $CARCH -eq 'x86_64' ]];
  then
    FOLDER="linux-amd64"
  fi

  install -Dm 755 "$srcdir/$FOLDER/draft" "$pkgdir/usr/bin/draft"
}
