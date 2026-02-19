pkgname=prometheus-folder-size-exporter
pkgver=2.0.0
pkgrel=1
pkgdesc="Folders size exporter. This tool exports the defined folders size in an exposed prometheus metrics format."
arch=('x86_64')
url='https://github.com/denix666/folder-size-exporter'
license=('MIT')

source=('https://github.com/denix666/folder-size-exporter/releases/download/v2.0.0/folder-size-exporter_linux_x86_64.tar.gz'
	'config.json.example'
	'folder-size-exporter.service')

package() {
    cd ${srcdir}
    install -D -m755 folder-size-exporter ${pkgdir}/usr/bin/folder-size-exporter
    install -D -m644 folder-size-exporter.service ${pkgdir}/usr/lib/systemd/system/folder-size-exporter.service
    install -D -m644 config.json.example ${pkgdir}/etc/folder-size-exporter/config.json.example
}
sha256sums=('3a5bb2a382f269b1da71a94297abe1f374d3278a9516736d19365114118748b8'
            '9339ac03bec740fea8c42bf8b53d30cff7d4b224bf171af550b75c12aa60ba62'
            'bdc1128bf2183812ea778c84dd20d0c29fcfc72b3fbb579550fe9c8384cc5a7a')
