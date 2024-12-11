# Maintainer: Dringsim <dringsim@qq.com>

pkgname=gap-jupyterkernel-install
pkgver=1.5.1
pkgrel=1
pkgdesc="install Jupyter kernel for GAP"
arch=('any')
url="https://github.com/EugeneLoy/coq_jupyter"
license=('BSD')
depends=('gap-jupyterkernel=1.5.1' 'gap-crypting' 'gap-gapdoc' 'gap-io' 'gap-json' 'gap-uuid' 'gap-zeromqinterface' 'python-jupyter-client')

package() {
    install -Dm644 /usr/lib/gap/pkg/jupyterkernel/etc/gap-mode/* -t "${pkgdir}/usr/share/jupyter/nbextensions/gap-mode"
    install -Dm644 /usr/lib/gap/pkg/jupyterkernel/etc/gap-mode.json -t "${pkgdir}/usr/share/jupyter/nbconfig/notebook.d"
    install -Dm644 /usr/lib/gap/pkg/jupyterkernel/etc/jupyter/* -t "${pkgdir}/usr/share/jupyter/kernels/gap-4"
    install -Dm755 /usr/lib/gap/pkg/jupyterkernel/bin/jupyter-kernel-gap -t "${pkgdir}/usr/bin"
	install -Dm644 /usr/lib/gap/pkg/jupyterkernel/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
