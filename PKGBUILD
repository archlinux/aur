# Maintainer: Milian Reichardt <mreichardt95@gmail.com>

pkgname=mono-pcl
pkgver=2014.04.14
pkgrel=1
pkgdesc="Microsoft Portable Reference Libraries"
arch=(any)
license=('unknown')
url="http://www.microsoft.com/en-us/download/details.aspx?id=40727"
depends=('mono' 'git')
source=(xamarin-referenceassemblies-pcl::git+https://github.com/directhex/xamarin-referenceassemblies-pcl)
md5sums=('SKIP')

build() {
  echo This space intentionally left blank > /dev/null
}

package() {
  mkdir -p "$pkgdir/usr/lib/mono/xbuild-frameworks/.NETPortable/"
  #cd "$srcdir/${pkgname}"
  cp -r "$srcdir/xamarin-referenceassemblies-pcl/v4.0" "$pkgdir/usr/lib/mono/xbuild-frameworks/.NETPortable/"
  cp -r "$srcdir/xamarin-referenceassemblies-pcl/v4.5" "$pkgdir/usr/lib/mono/xbuild-frameworks/.NETPortable/"
  cp -r "$srcdir/xamarin-referenceassemblies-pcl/v4.6" "$pkgdir/usr/lib/mono/xbuild-frameworks/.NETPortable/"
  find "$pkgdir" -type f -exec chmod 755 \{\} \;
}
