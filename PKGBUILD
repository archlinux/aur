# Maintainer: xpufx <github@xpufx.com>
pkgname=peazip-context-menu
pkgver=1.0
pkgrel=1
pkgdesc="Dolphin service menu: Extract with PeaZip"
arch=('any')
url="https://peazip.github.io/"
license=('LGPL-3.0-or-later')
depends=('peazip')
source=()
sha256sums=()

package() {
	install -Dm755 /dev/stdin "$pkgdir/usr/share/kio/servicemenus/peazip-extract.desktop" <<'EOF'
[Desktop Entry]
Type=Service
ServiceTypes=KonqPopupMenu/Plugin
Icon=peazip
X-KDE-Submenu=Extract with PeaZip
MimeType=application/bzip2;application/gzip;application/vnd.android.package-archive;application/vnd.ms-cab-compressed;application/vnd.debian.binary-package;application/x-7z-compressed;application/x-7z-compressed-tar;application/x-ace;application/x-alz;application/x-ar;application/x-archive;application/x-arj;application/x-brotli;application/x-bzip-brotli-tar;application/x-bzip;application/x-bzip-compressed-tar;application/x-bzip1;application/x-bzip1-compressed-tar;application/x-cabinet;application/x-cd-image;application/x-compress;application/x-compressed-tar;application/x-cpio;application/x-chrome-extension;application/x-deb;application/x-ear;application/x-ms-dos-executable;application/x-gtar;application/x-gzip;application/gzpostscript;application/x-java-archive;application/x-lha;application/x-lhz;application/x-lrzip;application/x-lrzip-compressed-tar;application/x-lz4;application/x-lzip;application/x-lzip-compressed-tar;application/x-lzma;application/x-lzma-compressed-tar;application/x-lzop;application/x-lz4-compressed-tar;application/x-ms-wim;application/x-rar;application/x-rar-compressed;application/x-rpm;application/x-source-rpm;application/x-rzip;application/x-rzip-compressed-tar;application/x-tar;application/x-tarz;application/x-tzo;application/x-stuffit;application/x-war;application/x-xar;application/x-xz;application/x-xz-compressed-tar;application/x-zip;application/x-zip-compressed;application/x-zstd-compressed-tar;application/x-zoo;application/zip;application/zstd;
Actions=ExtractHere;ExtractHereNewFolder;ExtractTo;ExtractDelete;

[Desktop Action ExtractHere]
Name=Extract archive here
Icon=peazip_extract
Exec=peazip -ext2here %F

[Desktop Action ExtractHereNewFolder]
Name=Extract archive here (to new folder)
Icon=peazip_extract
Exec=peazip -ext2folder %F

[Desktop Action ExtractTo]
Name=Extract archive to...
Icon=peazip_extract
Exec=peazip -ext2to %F
EOF
}
