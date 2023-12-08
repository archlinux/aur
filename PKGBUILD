pkgname=prometheus-folder-size-exporter
pkgver=0.1.1
pkgrel=1
pkgdesc="Folders size exporter written in Rust. This tool exports the defined folders size in an exposed prometheus metrics format."
arch=('x86_64')
url='https://github.com/denix666/folder-size-exporter'
license=('MIT')

source=('https://github.com/denix666/folder-size-exporter/releases/download/v0.1.1/folder-size-exporter_linux_x86_64.tar.gz'
	'config.json'
	'folder-size-exporter.service')

package() {
    cd ${srcdir}
    install -D -m755 folder-size-exporter ${pkgdir}/usr/bin/folder-size-exporter
    install -D -m644 folder-size-exporter.service ${pkgdir}//usr/lib/systemd/system/folder-size-exporter.service
    install -D -m644 config.json ${pkgdir}/etc/folder-size-exporter/config.json
}
sha256sums=('12a088eb140cf3388f72af130c25dc0c9812ccbbe3d4b50c7220a87ad9c76ee5'
            '5691144e8c5d85a30c967275449ae1017a678c63504293eda43fa734a2a76cfe'
            'bdc1128bf2183812ea778c84dd20d0c29fcfc72b3fbb579550fe9c8384cc5a7a')
