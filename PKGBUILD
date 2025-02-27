pkgname=python-lib3mf
_name=lib3mf
pkgver=2.3.2
pkgrel=1
pkgdesc='Implementation of the 3D Manufacturing Format file standard (python bindings)'
arch=('x86_64')
url='https://github.com/3MFConsortium/lib3mf'
license=('BSD-2-Clause')
depends=('lib3mf')
source=("__init__.py")
sha512sums=('56cbdd17b95bb98c0d40c294d6a1691594da9630ee0d7ba1e5f0cc4c8be8276edf51af30509b32ba8336a1f24a5b45e3e7436792afa246f3c54d6d8adae47d7c')
b2sums=('cf8f3e695861af2fdacb0d82bce0dc9c9424d8d671ffd37cf59250d3def01f957b57a80b4eb84b7ce0a1ddc339ce0b3a1da5c2bb2e7f2852f9602706b89f9ada')

package() {
  # provide a python package in site-packages
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -vDm644 -t "$pkgdir/$site_packages/$_name" "__init__.py"
  ln -s "/usr/lib/$_name.so" "$pkgdir/$site_packages/$_name/$_name.so"
  ln -s "/usr/include/$_name/Bindings/Python/Lib3MF.py" "$pkgdir/$site_packages/$_name/Lib3MF.py"
}
