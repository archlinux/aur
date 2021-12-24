# Maintainer: Specter119 <spcter119 AT gmail.com>

pkgname=jupyterlab-plotly
_name=${pkgname#jupyterlab-}
pkgver=5.5.0
pkgrel=1
pkgdesc='Jupyter Extension for Plotly.py.'
arch=(any)
url=https://pypi.org/project/${_name}/
license=(MIT)
depends=(python jupyterlab jupyter-nbformat)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('20b8a1a0f0434f9b8d10eb7caa66e947a9a1d698e5a53d40d447bbc0d2ae41f0')

package() {
  cd $srcdir/$_name-$pkgver
  mkdir -p $pkgdir/usr/share/jupyter/{nb,lab}extensions
  cp -r jupyterlab_plotly/nbextension $pkgdir/usr/share/jupyter/nbextensions/$pkgname
  cp -r jupyterlab_plotly/labextension $pkgdir/usr/share/jupyter/labextensions/$pkgname
  install -Dm644 ${pkgname}.json $pkgdir/etc/jupyter/nbconfig/notebook.d/${pkgname}.json
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}
