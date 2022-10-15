# Maintainer: Specter119 <spcter119 AT gmail.com>

pkgname=jupyterlab-plotly
_name=${pkgname#jupyterlab-}
pkgver=5.10.0
pkgrel=1
pkgdesc='Jupyter Extension for Plotly.py.'
arch=(any)
url=https://pypi.org/project/${_name}/
license=(MIT)
depends=(python jupyterlab jupyter-nbformat)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('4d36d9859b7a153b273562deeed8c292587a472eb1fd57cd4158ec89d9defadb')	

package() {
  cd $srcdir/$_name-$pkgver
  mkdir -p $pkgdir/usr/share/jupyter/{nb,lab}extensions
  cp -r jupyterlab_plotly/nbextension $pkgdir/usr/share/jupyter/nbextensions/$pkgname
  cp -r jupyterlab_plotly/labextension $pkgdir/usr/share/jupyter/labextensions/$pkgname
  install -Dm644 ${pkgname}.json $pkgdir/etc/jupyter/nbconfig/notebook.d/${pkgname}.json
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}
