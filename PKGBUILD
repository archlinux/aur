# Maintainer: xihale <i@xihale.top>
# Upstream publishes a unified Arch package (nfpm): /opt/ely-office plus
# /usr/bin symlinks, desktop entries, icons and systemd user unit. Repack verbatim.
pkgname=ely-office-bin
pkgver=0.1.17
pkgrel=2
pkgdesc='Ely Office - offline-first word processor, spreadsheet, presentation, PDF, Markdown, mail and Git suite (prebuilt upstream package)'
arch=('x86_64')
url='https://github.com/ELY-Open-Source/ElyOffice'
license=('MIT' 'MPL-2.0' 'AGPL-3.0-or-later' 'GPL-2.0-only')
depends=('curl' 'dbus' 'expat' 'glibc' 'krb5' 'libgcc' 'libstdc++' 'libxcb' 'vulkan-icd-loader' 'wayland' 'zlib')
provides=('ely-office' 'ely-doc' 'ely-mail' 'ely-mark' 'ely-pdf' 'ely-show' 'ely-table' 'ely-tree')
conflicts=('ely-office' 'ely-doc' 'ely-mail' 'ely-mark' 'ely-pdf' 'ely-show' 'ely-table' 'ely-tree'
           'ely-doc-bin' 'ely-mail-bin' 'ely-mark-bin' 'ely-pdf-bin' 'ely-show-bin' 'ely-table-bin' 'ely-tree-bin')
options=('!strip' '!debug')
install=ely-office-bin.install
source=("LICENSE::$url/raw/v$pkgver/LICENSE")
sha256sums=('6f90eb4b2f3d6354ac31cdf330a711d9e43d8c95b968dc046f49443db956b2c1')
source_x86_64=("ely-office-$pkgver-1-x86_64.pkg.tar.zst::$url/releases/download/v$pkgver/ely-office-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=('8b7ad2aa25deb305086529ffa25a60a7a8dc0d870b03aa9e93d7faa0cc186fe2')

package() {
	cp -a "$srcdir/opt" "$srcdir/usr" "$pkgdir/"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
