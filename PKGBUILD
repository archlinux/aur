# Maintainer: mickele <mimocciola@yahoo.com>
pkgname=gmsh-docs
_pkgname=gmsh
pkgver=2.9.3
pkgrel=1
pkgdesc="TXT, HMTL and PDF doc for Gmsh"
arch=('any')
url="http://www.geuz.org/gmsh/"
license=('GPL2')
makedepends=('cmake' 'texlive-core')
source=("${url}src/${_pkgname}-${pkgver}-source.tgz")
md5sums=('16a7ae54676b5c7b93a63b3bb07d7488')

build(){
   cd "${srcdir}/${_pkgname}-${pkgver}-source"

   mkdir -p build

   cd build

   cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
     -DENABLE_3M=OFF\
     -DENABLE_ACIS=OFF\
     -DENABLE_ANN=OFF\
     -DENABLE_BAMG=OFF\
     -DENABLE_BFGS=OFF\
     -DENABLE_BLAS_LAPACK=OFF\
     -DENABLE_BLOSSOM=OFF\
     -DENABLE_BUILD_LIB=OFF\
     -DENABLE_BUILD_SHARED=OFF\
     -DENABLE_BUILD_DYNAMIC=OFF\
     -DENABLE_BUILD_ANDROID=OFF\
     -DENABLE_BUILD_IOS=OFF\
     -DENABLE_CGNS=OFF\
     -DENABLE_CAIRO=OFF\
     -DENABLE_CHACO=OFF\
     -DENABLE_COMPRESSED_IO=OFF\
     -DENABLE_DINTEGRATION=OFF\
     -DENABLE_FLTK=OFF\
     -DENABLE_FOURIER_MODEL=OFF\
     -DENABLE_GMM=OFF\
     -DENABLE_GRAPHICS=OFF\
     -DENABLE_KBIPACK=OFF\
     -DENABLE_MATHEX=OFF\
     -DENABLE_MED=OFF\
     -DENABLE_MESH=OFF\
     -DENABLE_METIS=OFF\
     -DENABLE_MMG3D=OFF\
     -DENABLE_MPEG_ENCODE=OFF\
     -DENABLE_MPI=OFF\
     -DENABLE_MSVC_STATIC_RUNTIME=OFF\
     -DENABLE_MUMPS=OFF\
     -DENABLE_NATIVE_FILE_CHOOSER=OFF\
     -DENABLE_NETGEN=OFF\
     -DENABLE_NUMPY=OFF\
     -DENABLE_OCC=OFF\
     -DENABLE_ONELAB=OFF\
     -DENABLE_ONELAB2=OFF\
     -DENABLE_ONELAB_METAMODEL=OFF\
     -DENABLE_OPENMP=OFF\
     -DENABLE_OPTHOM=OFF\
     -DENABLE_OS_SPECIFIC_INSTALL=OFF\
     -DENABLE_OSMESA=OFF\
     -DENABLE_PARSER=OFF\
     -DENABLE_PETSC=OFF\
     -DENABLE_PLUGINS=OFF\
     -DENABLE_POST=OFF\
     -DENABLE_POPPLER=OFF\
     -DENABLE_QT=OFF\
     -DENABLE_RTREE=OFF\
     -DENABLE_SALOME=OFF\
     -DENABLE_SGEOM=OFF\
     -DENABLE_SLEPC=OFF\
     -DENABLE_SOLVER=OFF\
     -DENABLE_TAUCS=OFF\
     -DENABLE_TCMALLOC=OFF\
     -DENABLE_TETGEN=OFF\
     -DENABLE_TETGEN_OLD=OFF\
     -DENABLE_VORO3D=OFF\
     -DENABLE_WRAP_JAVA=OFF\
     -DENABLE_WRAP_PYTHON=OFF\
     ..

   LC_ALL=C make doc
}

package() {
   cd "${srcdir}/${_pkgname}-${pkgver}-source/build"

   bsdtar -xf ${_pkgname}-${pkgver}-doc.tgz

   cd "doc/texinfo"

   install -D -m644 gmsh.html "${pkgdir}/usr/share/doc/gmsh/gmsh.html"
   install -D -m644 gmsh.txt "${pkgdir}/usr/share/doc/gmsh/gmsh.txt"
   install -D -m644 gmsh.pdf "${pkgdir}/usr/share/doc/gmsh/gmsh.pdf"
   install -D -m644 gmsh.info "${pkgdir}/usr/share/info/gmsh.info"
}
